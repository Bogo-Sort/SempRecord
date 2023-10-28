import pickle
from random import choice    

# load the corpus from the pickle file
with open('corpus.pkl', 'rb') as f:
    corpus = pickle.load(f)
    verbs = corpus['verbs']
    nouns = corpus['nouns']
    adjs = corpus['adjectives']

def generate_filename():
    if choice([True, False]):
        return choice(adjs) + "_" + choice(nouns) + ".mp4"
    else:
        return choice(verbs) + "ing_" + choice(nouns) + ".mp4"
    
    
if __name__ == "__main__":
    # generate 20 filenames
    for i in range(20):
        print(generate_filename())
        print('\n')