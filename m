From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Sep 2015 10:19:55 +0200
Subject: [Buildroot] [PATCHv4 1/2] udisks: bump to version 1.0.5
In-Reply-To: <55ED445F.7040905@imgtec.com> (Vicente Olivert Riera's message of
 "Mon, 7 Sep 2015 09:01:35 +0100")
References: <1441203680-29193-1-git-send-email-Vincent.Riera@imgtec.com>
 <87y4gklrzq.fsf@dell.be.48ers.dk> <55ED445F.7040905@imgtec.com>
Message-ID: <87613mk5ec.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

Hi,

>> > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 >> > +UDISKS_CONF_OPTS += libgudev
 >> 
 >> Ehh, don't you mean UDISKS_DEPENDENCIES here?
 >> 

 > Ooops!, yes, UDISKS_DEPENDENCIES of course.

 > Should I send another version or can you amend that?

I'll amend it, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
