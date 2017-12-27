From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:29:43 +0100
Subject: [Buildroot] [PATCH 2/2] pulseaudio: fix libsamplerate dependency
In-Reply-To: <3e746e6aac146ae876e51f832d4979b1de3c6eb0.1513785771.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 20 Dec 2017 18:02:51 +0200")
References: <6e8f78216f2cc0177456fa5723e6ad37832833da.1513785771.git.baruch@tkos.co.il>
 <3e746e6aac146ae876e51f832d4979b1de3c6eb0.1513785771.git.baruch@tkos.co.il>
Message-ID: <87lghnold4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The (deprecated) libsamplerate support is not enabled unless
 > --enable-samplerate is passed to configure. Fix this.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
