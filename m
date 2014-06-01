From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 01 Jun 2014 09:29:12 -0300
Subject: [Buildroot] [PATCHv2 2/2] glibc: add eglibc 2.19-svnr25243 and
 choice menu
In-Reply-To: <20140601122459.GF4280@tarshish>
References: <1401623919-16671-1-git-send-email-gustavo@zacarias.com.ar>
 <1401623919-16671-2-git-send-email-gustavo@zacarias.com.ar>
 <20140601122459.GF4280@tarshish>
Message-ID: <538B1C98.7050703@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/01/2014 09:24 AM, Baruch Siach wrote:

> Is it possible to use BR2_EGLIBC_VERSION_2_1{8,9} here and avoid version 
> string duplication?

It's a bool, it'll just give 'y' if it's set...
Regards.
