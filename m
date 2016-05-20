From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Fri, 20 May 2016 16:26:53 +0200
Subject: [Buildroot] [RFC/PATCH next 2/2] couchdb: New package.
In-Reply-To: <20160520145341.156fab90@free-electrons.com>
References: <1463673580-10676-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <1463673580-10676-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <b4651105-f652-0bd1-b5ef-4cf0be436522@mind.be>
 <20160520145341.156fab90@free-electrons.com>
Message-ID: <573F1EAD.8040706@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/05/2016 14:53, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 20 May 2016 00:41:28 +0200, Arnout Vandecappelle wrote:
>> On 05/19/16 17:59, Nicolas Cavallari wrote:
>>> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>  
>>
>>  My first reaction was: can't we use a more recent version from git instead of
>> an almost-two-years-old release, but that won't be easy because of all the
>> submodules.
> 
> Does the latest git versions also need spidermonkey 1.8.5 ?

Yes, Unfortunately...

> If not, then I think I'd prefer to add support to fetch submodules (we
> already have patches doing this, from Yann, and they are reasonable),
> and skip the addition of this unmaintained spidermonkey thing.

These are not git submodules, they are submodules as in "./configure
git-clone them". Plus there are even more hardcoded /usr/include paths
in their build system. It seems wiser to wait for a tarball.
