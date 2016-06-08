From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 21:57:45 +0200
Subject: [Buildroot] [PATCH v2] kmsxx: new package
In-Reply-To: <20160608190424.GK14179@lukather>
References: <1462783135-16131-1-git-send-email-maxime.ripard@free-electrons.com>
 <91587869.72Lxhe2Mek@avalon>
 <CAGm1_ksFR80bBVtQDE_wiQ4mvky311-iHzZjWKJegWz=u23Z+Q@mail.gmail.com>
 <146541087.IVqEMkkuFm@avalon>
 <CAGm1_ksQWFgbVDdsJpnYV4F8cOJ9Prw5efUt0wbFNR6o41AxCw@mail.gmail.com>
 <CAGm1_kumQKFSzh5qGdBn18J1TgvipGFU6=51hCLdFrCF85p4xg@mail.gmail.com>
 <20160608190424.GK14179@lukather>
Message-ID: <20160608215745.0994dd60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Jun 2016 21:04:24 +0200, Maxime Ripard wrote:

> Honestly, I don't care at all about the python bindings.
> 
> I'll remove support for that in the v3, and if anyone is ever
> interested in adding support for it, he'll work on it (and things will
> have settled down hopefully)

FWIW: I discussed this topic with Maxime today. I very much prefer
having a basic kmsxx package merged, with the features that Maxime
uses/needs, rather than waiting endlessly to resolve all the Python
bindings issues. So let's merge a simpler version of kmsxx that doesn't
have the Python bindings, and when someone is interested enough to have
the Python bindings, this someone can submit follow-up patches.

So, yes, Maxime: please send a simpler version of the patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
