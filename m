From: Alexander Dahl <post@lespocky.de>
Date: Mon, 29 Mar 2021 15:23:57 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-03-21
In-Reply-To: <20210322114835.6hmpplzygzejxiab@falbala.internal.home.lespocky.de>
References: <20210322114835.6hmpplzygzejxiab@falbala.internal.home.lespocky.de>
Message-ID: <20210329132357.zxqt5szg72dchddu@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Mon, Mar 22, 2021 at 12:48:36PM +0100, Alexander Dahl wrote:
> I'm a little unhappy to annoy anyone with this request, however
> reports like the one below pop up over and over again in my INBOX like
> round about once a week.  

Meanwhile I had a look at my mail archive and it's exactly once a
week, every Monday morning since November 2020. The mail headers
contain this:

Received: from ks383786.kimsufi.com (ks383786.kimsufi.com [94.23.254.152])
        (Authenticated sender: bot at bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6A91C60017
        for <post@lespocky.de>; Mon, 29 Mar 2021 09:29:51 +0000 (UTC)

Maybe that helps identifying the bot which sends those mails on behalf
of Thomas?

btw: the mails don't go to the list, but to me personally only. I just
forwarded it to the list in hope someone else than Thomas might also
have an idea what's going on.

Greets
Alex

> That particular CVE issue in fastd was fixed
> upstream in October 2020 and was fixed for buildroot by Fabrice
> Fontaine few days later already.  See below.
> 
> On Mon, Mar 22, 2021 at 10:26:07AM -0000, Thomas Petazzoni wrote:
> > Hello,
> > 
> > Packages having CVEs
> > ====================
> > 
> > This is the list of packages for which a known CVE is affecting them,
> > which means a security vulnerability exists for those packages.
> > 
> > CVEs for the 'master' branch
> > ----------------------------
> > 
> >              name              |       CVE        |                             link                            
> > -------------------------------+------------------+--------------------------------------------------------------
> >                          fastd | CVE-2020-27638   | https://security-tracker.debian.org/tracker/CVE-2020-27638  
> > 
> 
> Fixed in master with 7e4af3ce3f91 ("package/fastd: fix
> CVE-2020-27638"). And it remains fixed after 148058a46293
> ("package/fastd: bump to version 21").
> 
> > 
> > CVEs for the '2020.11.x' branch
> > -------------------------------
> > 
> >              name              |       CVE        |                             link                            
> > -------------------------------+------------------+--------------------------------------------------------------
> >                          fastd | CVE-2020-27638   | https://security-tracker.debian.org/tracker/CVE-2020-27638  
> > 
> 
> Same commits as above are in this branch, too.
> 
> > 
> > CVEs for the '2021.02.x' branch
> > -------------------------------
> > 
> >              name              |       CVE        |                             link                            
> > -------------------------------+------------------+--------------------------------------------------------------
> >                          fastd | CVE-2020-27638   | https://security-tracker.debian.org/tracker/CVE-2020-27638  
> > 
> 
> Same commits as above are in this branch, too.
> 
> Could please someone with access to that bot fix it to not report
> already addressed CVEs anymore?
> 
> Thanks and greets
> Alex
> 
> -- 
> /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)



> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210329/9e7cf586/attachment.asc>
