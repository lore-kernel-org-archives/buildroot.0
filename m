From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2018 16:35:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-visualisation-goom: fix
 broken hash
In-Reply-To: <ma9jkex9qo.ln2@ID-313208.user.individual.net> (Bernd Kuhls's
 message of "Sun, 04 Feb 2018 13:01:58 +0100")
References: <20180203223150.27467-1-bernd.kuhls@t-online.de>
 <87d11lyszv.fsf@dell.be.48ers.dk>
 <ma9jkex9qo.ln2@ID-313208.user.individual.net>
Message-ID: <87h8qwydgt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

Hi,

 > sorry, this is not possible. The upstream repo does not have branches 
 > related to various Kodi versions, only a master branch and some older 
 > feature branches.

 > The commit from master branch used in buildroot is the last one 
 > compatible with Kodi 17.x-Krypton, later commits introduced changes for 
 > upcoming Kodi 18.x-Leia.

Ok, then I guess we'll just have to leave it like this for now until we
bump kodi :/

-- 
Bye, Peter Korsgaard
