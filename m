From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:44:40 +0100
Subject: [Buildroot] [PATCH v6 1/4] rabbitmq-c: BUILD_SHARED_LIBS is
 handled in pkg-cmake.mk
In-Reply-To: <1515068911-21112-2-git-send-email-heyleke@gmail.com>
References: <1515068911-21112-1-git-send-email-heyleke@gmail.com>
 <1515068911-21112-2-git-send-email-heyleke@gmail.com>
Message-ID: <20180107234440.59723967@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Jan 2018 13:28:28 +0100, Jan Heylen wrote:
> From: Jan Heylen <jan.heylen@nokia.com>
> 
> Signed-off-by: Jan Heylen <jan.heylen@nokia.com>

I've applied, after tweaking a bit the commit title and commit log:

    rabbitmq-c: don't pass BUILD_SHARED_LIBS
    
    The BUILD_SHARED_LIBS option is already handled by the cmake-package
    infrastructure, so there is no need to pass it at the package level.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
