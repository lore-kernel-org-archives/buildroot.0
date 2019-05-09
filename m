From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 May 2019 12:17:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: explicitly disable lua
In-Reply-To: <CAPi7W81GSpCx6KXnt2SxuLYBiLhR8n9OC97nFvcfrqMMwdLiTQ@mail.gmail.com>
 (Fabrice Fontaine's message of "Thu, 9 May 2019 11:28:54 +0200")
References: <20190508210543.13740-1-fontaine.fabrice@gmail.com>
 <87woj0gfwn.fsf@dell.be.48ers.dk>
 <CAPi7W81GSpCx6KXnt2SxuLYBiLhR8n9OC97nFvcfrqMMwdLiTQ@mail.gmail.com>
Message-ID: <87sgtogcdv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Dear Peter,
 > Le jeu. 9 mai 2019 ? 11:01, Peter Korsgaard <peter@korsgaard.com> a ?crit :
 >> 
 >> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> 
 >> > lua plugin has been added in version 5.6.0 with
 >> > https://github.com/collectd/collectd/commit/023092323ca617c8ff95b1efd4a055c29b1aaa3b
 >> 
 >> > Disabled it otherwise it'll be enabled if liblua is found
 >> 
 >> Is there any specific reason why we don't instead enable it if lua is
 >> enabled?
 > Because I didn't have time to test it yet and I saw that 2019.05-rc1
 > was released.
 > So my reasonig was to disable it for 2019.05 and enable it for next.

Ok, that is also fine by me.

Such meta-information can go into the commit message but under the --
line, so it doesn't end up in the git repo.

Committed, thanks.

-- 
Bye, Peter Korsgaard
