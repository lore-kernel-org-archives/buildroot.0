From: Jan Erichsen <jan@erichsen-web.de>
Date: Wed, 11 Mar 2015 13:07:26 +0100
Subject: [Buildroot] php-cgi not executing .php-file
In-Reply-To: <20150310144958.1fe74b9e@free-electrons.com>
References: <4318ea066b1d4331be3d63f7f2357bad@webmail-alfa3071.alfahosting-server.de>
 <20150310135111.7c67cad4@free-electrons.com>
 <482796e5cb84cdce7db36b558eaadb38@webmail-alfa3071.alfahosting-server.de>
 <20150310144958.1fe74b9e@free-electrons.com>
Message-ID: <f2a639d9b693859984c7605aaf3f8f76@webmail-alfa3071.alfahosting-server.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Am 2015-03-10 14:49, schrieb Thomas Petazzoni: 

> Dear Jan Erichsen,
> 
> Can you try with the CodeSourcery NIOS II toolchain that is
> pre-configured in Buildroot ? Just to rule out any toolchain issue.
> 
> Thanks,
> 
> Thomas

Thomes, you are a Hero! :)

It?s perfectly running with that toolchain. 

My settings now are: 

Toolchain type (External toolchain)
Toolchain (Sourcery CodeBench Nios-II 2013.05)
Toolchain origin (Toolchain to be downloaded and installed) 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150311/6748271b/attachment.html>
