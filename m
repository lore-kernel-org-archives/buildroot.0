From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:29:31 +0100
Subject: [Buildroot] [PATCH 1/2] pulseaudio: normalize alsa-lib optional
 dependency
In-Reply-To: <6e8f78216f2cc0177456fa5723e6ad37832833da.1513785771.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 20 Dec 2017 18:02:50 +0200")
References: <6e8f78216f2cc0177456fa5723e6ad37832833da.1513785771.git.baruch@tkos.co.il>
Message-ID: <87po6zoldg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Put together alsa-lib dependency and configure option code. As a side
 > effect we now avoid alsa-lib dependency when the required support in
 > alsa is missing.

 > Use positive logic.

 > Explicitly enable alsa support when available.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
