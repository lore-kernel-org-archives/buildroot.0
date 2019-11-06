From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Nov 2019 23:42:42 +0100
Subject: [Buildroot] [PATCH] package/python-autobahn: add missing
 dependency on C++
In-Reply-To: <20191029203701.9558-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 29 Oct 2019 21:37:01 +0100")
References: <20191029203701.9558-1-arnout@mind.be>
Message-ID: <874kzgd3tp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The indirect dependency via python-cryptography was not set in the
 > Config.in.

 > Detected with randconfig.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2019.08.x (2019.02.x has an older autobahn not using cryptography), thanks.

-- 
Bye, Peter Korsgaard
