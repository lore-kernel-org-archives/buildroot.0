From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 08 Apr 2013 13:54:58 -0300
Subject: [Buildroot] syslog messages during boot not recorded?
In-Reply-To: <CAKW0qihWyAonXk7=TB_Hq8q3E_pBuCv94D7eQ890ePx6b_CbMw@mail.gmail.com>
References: <loom.20130408T181747-784@post.gmane.org>
 <5162F298.7060909@zacarias.com.ar>
 <CAKW0qihWyAonXk7=TB_Hq8q3E_pBuCv94D7eQ890ePx6b_CbMw@mail.gmail.com>
Message-ID: <5162F662.1010608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/2013 01:51 PM, Francesco wrote:

> well, my buildroot is not the latest version... I'm using version
> 10.11 and I cannot see anything similar to IPC_SYSLOG in its
> .config... maybe this is a feature of newer buildroots?
> 
> Thanks!
> FM

It's a feature of BUSYBOX, not buildroot, meant for syslogd to work in
scenarios where your /var/log directory isn't writable for example.
Which begs the question, is it writable?
Regards.
