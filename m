From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 10 Jun 2019 00:39:27 +0200
Subject: [Buildroot] [PATCH 4/4] package/iputils: fix build without
 setcap
In-Reply-To: <CAPi7W80ms+GTYwC9Q6usykCFxWjA7+1FSy2-KR3qW16RFdEBPA@mail.gmail.com>
References: <20190609093814.14169-1-fontaine.fabrice@gmail.com>
 <20190609093814.14169-4-fontaine.fabrice@gmail.com>
 <dd4f00c5-f8ae-1758-48e4-bab512adb2a2@mind.be>
 <20190609214531.GA17515@x230>
 <CAPi7W80ms+GTYwC9Q6usykCFxWjA7+1FSy2-KR3qW16RFdEBPA@mail.gmail.com>
Message-ID: <20190609223926.GB26152@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Could you send the patch setting back IPUTILS_PERMISSIONS and using
> NO_SETCAP_OR_SUID?
Going to do it.
> From my understanding, permissions should be set to ping and
> traceroute6 as done before the dump but also to clockdiff and arping.
Also it's needed to create symlink from ping to ping6.
But haven't find a way how.

Kind regards,
Petr
