From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 15:29:31 +0200
Subject: [Buildroot] [git commit] pulseaudio : bump to version 3.0
In-Reply-To: <20130530144647.5d5237f9@skate> (Thomas Petazzoni's message of
 "Thu, 30 May 2013 14:46:47 +0200")
References: <20130530120917.AAE3A9A692@busybox.osuosl.org>
 <20130530144647.5d5237f9@skate>
Message-ID: <87ehco1tqc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Wed, 29 May 2013 21:44:27 +0200, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=d3bde0a64edb5a3392314d2cdd2c4e4057d15831
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
 >> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

 Thomas> (As discussed on IRC)

 Thomas> This shouldn't be committed on the master branch, and as J?r?my
 Thomas> highlighted in his patch series, the bump of Pulseaudio requires
 Thomas> bumping libtool, which we certainly cannot do in master right now.

Argh, I must have applied the wrong patch. I blame the cold medication
:/

Will revert.

-- 
Bye, Peter Korsgaard
