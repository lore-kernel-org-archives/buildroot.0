From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Aug 2016 23:54:03 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
	Buildroot developers
In-Reply-To: <20160823234027.49044576@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 23 Aug 2016 23:40:27 +0200")
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87d1kzjj2w.fsf@dell.be.48ers.dk>
 <20160823234027.49044576@free-electrons.com>
Message-ID: <87y43ngnic.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Tue, 23 Aug 2016 23:01:27 +0200, Peter Korsgaard wrote:

 >> I know this is just a first try (and I don't mind), but interesting that
 >> your script flagged me for wpa_supplicant (and nobody else), considering
 >> I have never used it in buildroot, a number of other people have added
 >> new features and fixes, and my last real fix to it was in 2010.

 > It's because of commit 6828f982b89c4f85101fb8cfd5987ae4b1992de8:

 > commit 6828f982b89c4f85101fb8cfd5987ae4b1992de8
 > Author: Peter Korsgaard <jacmet@sunsite.dk>
 > Date:   Mon Mar 9 20:28:40 2009 +0000

 >     wpa_supplicant: new package
    
 >     Patch by Gustavo Zacarias <gustavo@zacarias.com.br>
    
 >     Closes #81.

 > The patch was indeed provided by Gustavo, but you are the author of the
 > patch, and that's what my script was looking at.

Ahh, ok. And your script really looks for something like

'<foo>: new package' and not just the first commit for for E.G. every
.mk file?

E.G. it didn't flag me as developer for package/opus:

commit c226de26ec1379a88f7fe0e278ceb5888b92a054
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Tue Sep 11 22:45:08 2012 +0200

    package: add opus audio codec library

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

or package/pulseaudio:

commit d96e977e372a9b7b7c681fc7bc6902211273ea1e
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Wed Oct 19 15:25:11 2011 +0200

    package: add pulseaudio

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

or package/jquery:

commit 4e20e8fe00b7125e2fe4538c69c6560f5bb75121
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Sun Dec 18 23:11:14 2011 +0100

    package: add Javascript menu and jQuery package

    A lot of open source Javascript libraries can be interesting to use on
    embedded systems, so add a specific Javascript menu and the probably most
    well known library of them all, jQuery.

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

 > I'll change that and put Gustavo as the referee for the wpa_supplicant
 > package.

great!

 > Thanks for the feedback!

You're welcome, the series looks OK to me.

-- 
Venlig hilsen,
Peter Korsgaard 
