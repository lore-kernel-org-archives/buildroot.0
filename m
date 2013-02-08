From: Aditya Rawat <aditya@eddywebs.com>
Date: Fri, 8 Feb 2013 10:21:17 -0500
Subject: [Buildroot] Running Packages
In-Reply-To: <511498BE.4030108@siganos.org>
References: <CAFzEKXETDCU8FTapwDLP1gpTOP=y9ETGjUfrDRxUxMGtkxi-+Q@mail.gmail.com>
 <511498BE.4030108@siganos.org>
Message-ID: <CAFzEKXHK58EP_KjNQA-x46YP-SXHQMoeBn_4U1DcpJ3Ho4Z7Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank your for the insight Dimitris , the Buildroot environment is
quite aged( Released February 28th, 2011) but has php :D >>
https://github.com/j1nx/buildroot-AmLogic

The original Buildroot environment above had php5.2 so I replaced only
the /package/php dir with the one which had a php5.3
(http://git.buildroot.net/buildroot/commit/?id=aeb9350cfbd2f4675f0d095394660cc0c2cc0d7b)
Seems like it missing it target altogether, I will try the "make
php-dirclean php" and post my findings.

--
Best Wishes;
Adi
