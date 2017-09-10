From: Petr Kulhavy <brain@jikos.cz>
Date: Sun, 10 Sep 2017 11:57:11 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
In-Reply-To: <20170910080432.0a6bc7b6@windsurf.lan>
References: <1504977449-30925-1-git-send-email-brain@jikos.cz>
 <20170909220851.56a41dc1@windsurf.lan>
 <a9a2f132-bb2f-a79e-cd8e-4116ae096691@jikos.cz>
 <20170910080432.0a6bc7b6@windsurf.lan>
Message-ID: <4fc82e66-0448-2fe9-c858-853ba83dfe7c@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 10/09/17 08:04, Thomas Petazzoni wrote:
> Hello,
>
> On Sat, 9 Sep 2017 22:53:06 +0200, Petr Kulhavy wrote:
>
>>> Why are you removing the hash ?
>> Well, I was just following the BR manual :-) Where it says that "none"
>> is used for cloned repositories.
> >From the manual:
>
> """
> Hashes are currently checked for files fetched from http/ftp servers,
> Git repositories, files copied using scp and local files. Hashes are
> not checked for other version control systems (such as Subversion, CVS,
> etc.) because Buildroot currently does not generate reproducible
> tarballs when source code is fetched from such version control systems.
> """

Even here I would be more specific. A file fetched from a GIT repository 
is for me not the same as a clone of a GIT repository.


Regards
Petr
