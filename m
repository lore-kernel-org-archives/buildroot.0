From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Date: Tue, 3 Jul 2018 10:44:27 +0200
Subject: [Buildroot] [PATCH 1/3] systemd: bump to v239
In-Reply-To: <20180701141925.69267e02@windsurf.home>
References: <20180629222552.12808-1-jeremy.rosen@smile.fr>
 <20180629222552.12808-2-jeremy.rosen@smile.fr>
 <20180701141925.69267e02@windsurf.home>
Message-ID: <6efcdf57-c71d-e360-8d0c-d16d872b4b5f@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks a lot.

I was preparing a V2 with the same fixes, but you were too fast for me

:)
J?r?my

On 01/07/2018 14:19, Thomas Petazzoni wrote:
> Hello,
>
> On Sat, 30 Jun 2018 00:25:50 +0200, J?r?my Rosen wrote:
>> * remove upstreamed patches
>> * refresh patch 0002 which didn't apply cleanly
>> * update patch 0001 to catch more uses of agetty
>>
>>
>> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
>> ---
>>   package/systemd/0001-fix-getty-unit.patch     |  61 ++++--
>>   .../0002-install-don-t-use-ln-relative.patch  |  19 +-
>>   ...-include-libmount-h-in-a-header-file.patch |  75 -------
>>   .../0005-basic-macros-rename-noreturn.patch   | 201 ------------------
>>   package/systemd/systemd.hash                  |   2 +-
>>   package/systemd/systemd.mk                    |   2 +-
>>   6 files changed, 63 insertions(+), 297 deletions(-)
>>   delete mode 100644 package/systemd/0004-core-dont-include-libmount-h-in-a-header-file.patch
>>   delete mode 100644 package/systemd/0005-basic-macros-rename-noreturn.patch
> I've applied, after fixing the issues pointed out by Romain: do not
> re-assign the patches to yourself when you're just making some small
> adjustements, use "git format-patch -N".
>
> Also, you forgot to update the hash of the README file, which has
> changed. That was breaking "make legal-info", so I fixed that.
>
> Finally, I did a follow-up commit dropping the 0003 patch, which as
> noted by Romain Naour was no longer needed.
>
> Thanks!
>
> Thomas

-- 
SMILE <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine

	
*J?r?my ROSEN*
Architecte technique
Responsable de l'expertise Smile-ECS

email jeremy.rosen at smile.fr <mailto:jeremy.rosen@smile.fr>
phone +33141402967
url http://www.smile.eu

Twitter <https://twitter.com/GroupeSmile> Facebook 
<https://www.facebook.com/smileopensource> LinkedIn 
<https://www.linkedin.com/company/smile> Github 
<https://github.com/Smile-SA>


D?couvrez l?univers Smile, rendez-vous sur smile.eu 
<http://smile.eu/?utm_source=signature&utm_medium=email&utm_campaign=signature>

eco Pour la plan?te, n'imprimez ce mail que si c'est n?cessaire
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180703/cf05ba2a/attachment.html>
