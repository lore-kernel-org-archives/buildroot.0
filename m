From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 26 Aug 2015 16:58:40 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tvheadend: Fix static build
References: <1440537516-1908-1-git-send-email-bernd.kuhls@t-online.de>
 <20150826152055.1a997b1f@free-electrons.com>
Message-ID: <0q01bcxqlc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 26 Aug 2015 15:20:55 +0200 schrieb Thomas Petazzoni:

> Instead of this hack, could you implement a better fix that can be
> upstreamed? -ldl is indeed needed only to build the extras. Can you try
> (and push upstream) something like the following patch?

Hi,

tvheadend requires to sign a "Contributor License Agreement" when 
contributing code:
https://tvheadend.org/projects/tvheadend/wiki/Contributors

Since you suggested the patch in question I can not sign such a CLA:
"You affirm that you have the right to provide the contribution (i.e. 
it's your own work)." ;)

How to proceed?

Regards, Bernd
