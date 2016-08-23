From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Aug 2016 23:01:27 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
	Buildroot developers
In-Reply-To: <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 23 Aug 2016 14:47:44 +0200")
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d1kzjj2w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > This is an initial list of Buildroot developers. It has been created
 > semi-automatically by parsing the Git history, and finding the authors
 > of commits with a title like "<foo>: new package". Some additional
 > manual tweaking has been done (merging multiple entries corresponding to
 > the same person, adding some more entries, etc.).

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > +N:	Peter Korsgaard <peter@korsgaard.com>
 > +F:	package/flickcurl/
 > +F:	package/libfastjson/
 > +F:	package/lzop/
 > +F:	package/python-alsaaudio/
 > +F:	package/python-enum/
 > +F:	package/python-enum34/
 > +F:	package/python-ipaddr/
 > +F:	package/python-pam/
 > +F:	package/python-psutil/
 > +F:	package/triggerhappy/
 > +F:	package/wpa_supplicant/

I know this is just a first try (and I don't mind), but interesting that
your script flagged me for wpa_supplicant (and nobody else), considering
I have never used it in buildroot, a number of other people have added
new features and fixes, and my last real fix to it was in 2010.

-- 
Bye, Peter Korsgaard
