From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 8 Apr 2021 17:32:06 +0300
Subject: [Buildroot] - Question: How to change safely /var/log --> /tmp
 in buildroot
In-Reply-To: <c2d6ee0a-995c-b403-b21c-2dd642104c6b@gmail.com>
References: <c2d6ee0a-995c-b403-b21c-2dd642104c6b@gmail.com>
Message-ID: <e7b52c9d-e255-21c8-26f2-8637e15868a6@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Marko

08.04.2021 16:41, Marko Stanisic ?????:
> Hello,
> 
> I have no clue how? the symlink? /var/log --> ../tmp is statically 
> defined. (in buildroot)
> 


This link is created by skeleton-init-sysv or skeleton-init-openrc package
