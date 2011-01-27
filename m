From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jan 2011 12:43:43 -0300
Subject: [Buildroot] [PATCH 1/2] ocf: new package
In-Reply-To: <20110127163140.18b76fe2@surf>
References: <1296140805-24128-1-git-send-email-gustavo@zacarias.com.ar>
	<20110127163140.18b76fe2@surf>
Message-ID: <4D4192AF.7000108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/27/11 12:31, Thomas Petazzoni wrote:

> On Thu, 27 Jan 2011 12:06:44 -0300
> Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> 
>> +OCF_SRCDIR = $(call qstrip,$(BR2_PACKAGE_OCF_SRC))
>> +OCF_BUILDDIR = $(OCF_DIR)
> 
> Why is this needed ?
> 
> Thomas

Copy/Paste too much from your example maybe?
