From: Francesco <francesco.montorsi@gmail.com>
Date: Mon, 8 Apr 2013 18:51:19 +0200
Subject: [Buildroot] syslog messages during boot not recorded?
In-Reply-To: <5162F298.7060909@zacarias.com.ar>
References: <loom.20130408T181747-784@post.gmane.org>
 <5162F298.7060909@zacarias.com.ar>
Message-ID: <CAKW0qihWyAonXk7=TB_Hq8q3E_pBuCv94D7eQ890ePx6b_CbMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2013/4/8 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> Or maybe your busybox is configured to use the circular buffer (in RAM)
> for logs (CONFIG_FEATURE_IPC_SYSLOG)... and you should just read your
> logs with "logread"...
well, my buildroot is not the latest version... I'm using version
10.11 and I cannot see anything similar to IPC_SYSLOG in its
.config... maybe this is a feature of newer buildroots?

Thanks!
FM
