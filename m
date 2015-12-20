From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Dec 2015 14:52:23 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/kodi-visualisation-goom: new
	package
References: <1446239247-6651-1-git-send-email-bernd.kuhls@t-online.de>
 <20151220142438.02fc1f98@free-electrons.com>
Message-ID: <mdoikcxh6u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 20 Dec 2015 14:24:38 +0100 schrieb Thomas Petazzoni:

> Dear Bernd Kuhls,
> 
> On Fri, 30 Oct 2015 22:07:26 +0100, Bernd Kuhls wrote:
>> Signed-off-by: Bernd Kuhls
>> <bernd.kuhls@t-online.de>
>> ---
>> v4. bumped version, changed _LICENSE_FILES back to ./COPYING,
>>     upstream clarified its license:
>>     https://github.com/notspiff/visualization.goom/commit/
f8dea024abe2385a91061a7e8e98bdeed3c8f74e
>> v3: added hash, sent patch upstream, updated _LICENSE_FILES (Thomas)
>> v2: rebased
> 
> Am I right that your upcoming Kodi 16 series will carry a patch adding
> this package, and ditto for the rsxs thing?

Hi Thomas,

yes, because Kodi 16 does not include the code for Goom and rsxs anymore.
But my Goom/rsxs patches are meant to be used with the current 15.2 
version of Kodi already, they do not depend on Kodi 16 and can be applied 
to buildroot after review at any time.

Regards, Bernd
