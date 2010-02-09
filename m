From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 09 Feb 2010 10:59:58 -0300
Subject: [Buildroot] [PATCH 03/10] lua: conversion to new
	package	infrastructure
In-Reply-To: <1265561742-5924-4-git-send-email-llandwerlin@gmail.com>
References: <1265561742-5924-1-git-send-email-llandwerlin@gmail.com>
	<1265561742-5924-4-git-send-email-llandwerlin@gmail.com>
Message-ID: <4B716A5E.8040305@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/07/2010 01:55 PM, llandwerlin at gmail.com wrote:

> From: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Also install development files to staging by default and to target if
> requested.
> 
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>

Did you see https://bugs.busybox.net/show_bug.cgi?id=803 ?
Your patch lacks some modularity (ability to disable lua and luac
installation, install shared liblua, disable readline support) and
module loading support (-DLUA_USE_DLOPEN).
Regards.
