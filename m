From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Sep 2012 21:18:19 +0200
Subject: [Buildroot] [PATCH 2/4] Make Berkeley DB a dependency of
 linux-pam and make sure it is selected
In-Reply-To: <1347078066-25257-2-git-send-email-golubovsky@gmail.com>
References: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
 <1347078066-25257-2-git-send-email-golubovsky@gmail.com>
Message-ID: <504F8E7B.1060102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/12 06:21, Dmitry wrote:
> The pam_userdb module is used to verify a username/password pair
> against values stored in a Berkeley DB database. The database is
> indexed by the username, and the data fields corresponding to the
> username keys are the passwords (from man 8 pam_userdb).

  There is a patch on the list that introduces gdbm.  Do you think that could
be an alternative for berkeleydb?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
