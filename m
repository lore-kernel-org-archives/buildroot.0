From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Oct 2017 16:20:11 +0200
Subject: [Buildroot] [PATCH 4/5] support/testing: fix remaining code
	style
In-Reply-To: <4fe624ec-385e-9f16-88c5-2cf6ca773dd6@mind.be> (Arnout
 Vandecappelle's message of "Mon, 2 Oct 2017 15:48:51 +0200")
References: <20170929080419.GA2899@scaer>
 <59d191cdafd96_6a703fce1469bdfc55573@ultri3.mail>
 <20171002060649.GC4753@scaer>
 <4fe624ec-385e-9f16-88c5-2cf6ca773dd6@mind.be>
Message-ID: <87shf1d42s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  For me, the ideal is to wrap at 80 columns most of the time, but allow
 > exceptions up to something like 105 columns. 105 is still reasonable for
 > side-by-side on a wide display with some room for scrollbars. I know, Yann, that
 > you can easily fit 132 characters on side-by-side, but you've got an eagle-eyed
 > font size :-) That said, I can live with 132 as the absolute maximum. However, I
 > do think we should _normally_ wrap at 80 columns.

 >  Standardizing on 80 columns is good because it's what we do in the rest of
 > Buildroot. Allowing exceptions is good because there are some lines you really
 > don't want to split (strings, mostly).

 >  So ideally, I'd like to have a warning for anything about 80 columns, and an
 > error for anything over 105 (or 132). Unfortunately, I don't think flake8 allows
 > that. So let's say we put 132 in the config file, but enforce 80 columns in review.

Agreed! I also think sticking to 80 columns where possible would be good.

-- 
Bye, Peter Korsgaard
