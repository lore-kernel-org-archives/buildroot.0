From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 09:54:59 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <20171105083549.GD2996@scaer> (Yann E. MORIN's message of "Sun, 5
 Nov 2017 09:35:49 +0100")
References: <1509720041684-0.post@n4.nabble.com> <20171105083549.GD2996@scaer>
Message-ID: <87po8x2jh8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > So, this patch is NAK from me.

Agreed.

 > However, if you really, like realy-really, want to override it to
 > something else, then just export SOURCE_DATE_EPOCH before calling
 > Buildroot.

We afaik don't support this yet as SOURCE_DATE_EPOCH is unconditionally
exported, but that could get fixed naturally.

-- 
Bye, Peter Korsgaard
