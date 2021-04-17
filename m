From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Apr 2021 09:13:17 +0200
Subject: [Buildroot] Unable to apply a patch for the buildroot makedevs
 tool
In-Reply-To: <AM6PR05MB5928D4AD5D2311ACA772CCA5A34C9@AM6PR05MB5928.eurprd05.prod.outlook.com>
References: <AM6PR05MB5928D4AD5D2311ACA772CCA5A34C9@AM6PR05MB5928.eurprd05.prod.outlook.com>
Message-ID: <20210417071317.GO359705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivan, All,

On 2021-04-16 06:58 +0000, Ivan Castell spake thusly:
> Hello! I did a patch for the makedevs tool that provides a new 'x' option
> that allows setting permissions for directories recursively without
> modifiying permissions for regular files.

As Peter said, makedev is directly compiled from its single source file
in Buildroot's tree, so no way to patch it with the standard package
infrastructure.

However, your patch looks like it would provide an interesting feature
that we want in Buildroot.

Would you mind officially contributing your patch so we can apply it?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
