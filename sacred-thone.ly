\version "2.24.0"
\header {
	title = "Sacred Throne. C.M."
	poet = "John Kent, 1803"
	composer = "Hugh Wilson, 1825. Arr. Hugh McGraw, 1966"
	tagline = "Camp Fasola 2023"
}
#(set-default-paper-size "letterlandscape")

stanzaOne = \lyricmode {
	\set stanza = "1."
	Be -- neath the sac -- red throne of God I saw a riv -- er rise;
	The streams were peace and par -- doning blood de -- scend -- ing from the skies.
}

stanzaTwo = \lyricmode {
	\set stanza = "2."
  An -- ge -- lic minds can -- not ex -- plore this deep, un -- fa -- thomed sea:
'Tis void of bot -- tom, brim, or shore and lost in De -- i -- ty.


}

stanzaThree = \lyricmode {
	\set stanza = "3."
  I stood a -- mazed, and won -- dered when or why this o -- cean rose,
That wafts sal -- va -- tion down to men, his trai -- tors and his foes.

}

stanzaFour = \lyricmode {
	\set stanza = "4."
	That sa -- cred flood, from Je -- sus' veins was free to take a -- way
A Ma -- ry's or Ma -- nas -- seh's stains, or sins more vile than they.
}
%% TODO set alto, bass
sopranoMusic = {
	\sacredHarpHeads
	\clef treble
	\key bes \major
	\autoBeamOff
	\time 3/4
	\relative c' {
     r2 bes'4 | d2 d8([c8]) | bes2 bes4 | f'2 f4 | d2  bes4 | d2 d8([c8]) | d2 f4 | f2\fermata d4 |
		 bes2 c4 | d2 bes4 | bes2 d4 | f2 f4 | d2 d8([ees8]) | f2 f4 | d2. ||
	}
}

altoMusic = {
	\sacredHarpHeads
	\clef treble
	\key bes \major
	\autoBeamOff
	\time 3/4
	\relative c' {
	    r2 d4 | f2 f8([ees8]) | d2 f8([g8])| f2 f8([ees8]) | f2 f4 | f2 f4 | f2 bes4 | a2\fermata a4 |
			f2 f4 | f2 f4 | g2 bes4 | a2 f4 | d4( ees4) f8([ g8)] | bes2 a4 | f2. ||
	}
}

tenorMusic = {
	\sacredHarpHeads
	\clef treble
	\key bes \major
	\autoBeamOn
	\time 3/4
	\relative c' {
		 r2 f4 | bes2 g4 | f2 bes8([ c8)] | d2 c4 |  bes2 d4 | f2 d8([ c8])  | bes2 d4 | c2\fermata f4 |
		 d2 c4 | bes2 d4 | ees2 d4 | c2 d4| f,4 ( g4 ) bes8([ c8)]| d2 c4 | bes2. ||
	}
}

bassMusic = {
	\sacredHarpHeads
	\clef bass
	\key bes \major
	\autoBeamOff
	\time 3/4
	\relative c {

		  r2 bes4 | bes2 bes4 | bes2 d8([ ees8)] | f2 f4 | bes,2 bes'4 | bes2  bes,8([ c8)] | d2 bes8([ d8)] | f2\fermata f4 |
			bes2 f8([ ees8)] | d2 bes'4 | ees,2 bes4 | f'2 bes,4 | bes4 ( ees4 ) d8([ ees8)] | f2 f4 | bes,2. ||
	}
}

\score {
	<<
		\new Voice = "one" { \sopranoMusic }
		\new Lyrics = "verseOne"
		\new Voice = "two" { \altoMusic }
		\new Lyrics = "verseTwo"
			\new Lyrics = "verseThree"
		\new Voice = "three" { \tenorMusic }
		\new Lyrics = "verseFour"
		\new Voice = "four" { \bassMusic }

		\context Lyrics = "verseOne" {
			\lyricsto "three" { \stanzaOne }
		}
%		\context Lyrics = "verseTwo" {
%			\lyricsto "three" { \stanzaTwo }
%		}
		\context Lyrics = "verseThree" {
			\lyricsto "three" { \stanzaThree }
		}
		\context Lyrics = "verseFour" {
			\lyricsto "three" { \stanzaFour }
		}

	>>
	\layout {
		indent = 0 \cm
		firstpagenumber = no
		papersize = "letter", landscape
	}
	\midi{
		\context { \Voice
			\consists "Staff_performer"
		}
		\context { \Score
			tempoWholesPerMinute = #(ly:make-moment 52 2)
		}
	}
}
