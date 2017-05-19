From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 May 2017 15:43:03 +0200
Subject: [Buildroot] [PATCH] cppcms: fix build on machines with
 libgpg-error installed
In-Reply-To: <a75f7181-47dd-94fa-5e39-4d7e4f92d9e2@gmail.com>
References: <1495058001-29457-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <a75f7181-47dd-94fa-5e39-4d7e4f92d9e2@gmail.com>
Message-ID: <20170519154303.19097c93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 May 2017 23:35:57 +0200, Romain Naour wrote:

> I'm unable to reproduce this issue since I don't have /usr/lib at the end of
> "-Wl,-rpath" line.
> 
> Even trying to execute the command line manually it build fine here. (I checked
> that libgpg-error is installed).

Do you have libgpg-error-dev installed as well?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
