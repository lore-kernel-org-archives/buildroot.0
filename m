From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 15:38:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <19162136.post@talk.nabble.com> (Daniel Laird's message of "Tue\,
	26 Aug 2008 06\:32\:13 -0700 \(PDT\)")
References: <20080826121930.77B8B3C79C@busybox.net>
	<87k5e3gbne.fsf@macbook.be.48ers.dk> <19162136.post@talk.nabble.com>
Message-ID: <878wujew0p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Laird <daniel.j.laird@nxp.com> writes:

 Daniel> I will amend the Config.in to do as suggested:
 Daniel> Config.in
 Daniel> select CUPS if ......

Thanks.


 Daniel> However this does raise the wider issue of what should be
 Daniel> auto selected and what should be chosen IMHO I feel CUPS is
 Daniel> not a necessary thing for GTK??  Therefore why is it being
 Daniel> autoselected for X builds.  If someone wants cups then they
 Daniel> should select it in their configuration file.  Packages that
 Daniel> compile differently due to the selection of another package
 Daniel> could use something like:

Sorry, I have no idea why gtk wants to select cups. Ninevoltz added it
in r21206.

-- 
Bye, Peter Korsgaard
