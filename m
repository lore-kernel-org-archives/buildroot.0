From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Apr 2015 09:05:07 +0200
Subject: [Buildroot] [PATCH 1/3] package/c-ares: add hash
In-Reply-To: <1429583936-13335-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Tue, 21 Apr 2015 04:38:54 +0200")
References: <1429583936-13335-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87mw22t10c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 > ---
 >  package/c-ares/c-ares.hash | 2 ++
 >  1 file changed, 2 insertions(+)
 >  create mode 100644 package/c-ares/c-ares.hash

 > diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
 > new file mode 100644
 > index 0000000..ce614d8
 > --- /dev/null
 > +++ b/package/c-ares/c-ares.hash
 > @@ -0,0 +1,2 @@
 > +# Locally calculated
 > +sha256 3d701674615d1158e56a59aaede7891f2dde3da0f46a6d3c684e0ae70f52d3db c-ares-1.10.0.tar.gz

Upstream provides a gpg signature, so I've verified against that and
updated the comment, thanks.

-- 
Bye, Peter Korsgaard
