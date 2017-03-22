From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 14:08:07 +0100
Subject: [Buildroot] [PATCH v3 4/5] support/testing: add package tests
In-Reply-To: <CAAXf6LWnfh2s1yiXGmkte4q-KYbEdzXimn69d1spqrZM7eJ8WQ@mail.gmail.com>
References: <1490042214-6762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490042214-6762-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LWnfh2s1yiXGmkte4q-KYbEdzXimn69d1spqrZM7eJ8WQ@mail.gmail.com>
Message-ID: <20170322140807.6caea0b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 09:26:01 +0100, Thomas De Schampheleire wrote:

> This can be done using the paramiko python module, basically:
> 
>             import paramiko
>             client = paramiko.SSHClient()
>             client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
>             client.connect(host, username=user, password=pass)

Good idea. Let's leave this as a future improvement :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
