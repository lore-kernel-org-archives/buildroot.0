From: Roland <rolandu@gmail.com>
Date: Tue, 06 Mar 2012 20:14:53 +0200
Subject: [Buildroot] [PATCH] Make libmicrohttpd version configurable
In-Reply-To: <20120306184933.5dbaf329@skate>
References: <1331054328-6564-1-git-send-email-rolandu@gmail.com>
 <20120306182046.56f21098@skate>
 <CAG0mjpva6VP1u7EK9oOXUqeYYypCiC2yuE7ag4UtBqCkgc52UA@mail.gmail.com>
 <20120306184933.5dbaf329@skate>
Message-ID: <4F56541D.3010508@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, didn't know about the 'one version only policy'.

Le Tue, 6 Mar 2012 19:38:39 +0200, Roland Uuesoo <rolandu@gmail.com> a 
?crit :
>> Version 0.4.6 is 2 years old (13 march 2010).
>>
>> A lot of bugs/security problems have been fixed.
>>
>> And there are new features added.
> Ok.
>
>> Made it configurable because someone might need the old version.
> Then just bump the version to whatever more recent version is
> available. We don't support multiple versions per package in Buildroot,
> because it would be a maintenance nightmare. For example: each version
> will need different patches, different configuration options, etc.
>
> So we have decided to keep things simple and support only one version
> at a time, except for U-Boot, Barebox, kernel, and critical things like
> that. People doing a project with Buildroot are anyway forking a
> particular version of Buildroot to ensure that they are fixed on a
> given version of all the components they are using in their system.
>
> Best regards,
>
> Thomas
