From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 19:13:28 +0100
Subject: [Buildroot] [PATCH] package/tinc: upgrade to 1.0.33,
 install upstream's systemd files
In-Reply-To: <1516992884-5880-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 (Zoltan Gyarmati's message of "Fri, 26 Jan 2018 19:54:44 +0100")
References: <1516992884-5880-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
Message-ID: <87vafnf9vb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zoltan" == Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com> writes:

 > Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 > ---
 >  package/tinc/tinc.hash | 5 ++++-
 >  package/tinc/tinc.mk   | 7 ++++++-
 >  2 files changed, 10 insertions(+), 2 deletions(-)

 > diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
 > index 135a4f3..15580dd 100644
 > --- a/package/tinc/tinc.hash
 > +++ b/package/tinc/tinc.hash
 > @@ -1,2 +1,5 @@
 >  # Locally calculated after checking pgp signature
 > -sha256	abc17e25afc1b9e74423c78fef586b11d503cbbbe5e4a2ed323870f4a82faa73 tinc-1.0.30.tar.gz
 > +sha256	7f6f5dc6444bc651ac635c81f4745bcce581bbd1d45ed60cbdc4ee11bebb10f4 tinc-1.0.33.tar.gz
 > +sha256  10618781fe68ee0958d627f9f4b279b55eaff6c852f7742bbef64dc470c0077c COPYING
 > +sha256  9bf76a8aa304d807df20bf3d221c21d259764be63e39b58f299b80ba3ac14b5b COPYING.README
 > +

Extra newline here. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
