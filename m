From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Apr 2013 16:31:35 +0200
Subject: [Buildroot] [PATCH 1/2] glibmm: new package
In-Reply-To: <517698B7.1050405@zacarias.com.ar>
References: <1366726167-3396-1-git-send-email-nicolas.menegale@openwide.fr>
 <517698B7.1050405@zacarias.com.ar>
Message-ID: <20130423163135.171132f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 23 Apr 2013 11:20:39 -0300, Gustavo Zacarias wrote:

> libglib2 depends on BR2_USE_WCHAR, you should add that too as a depend
> in Config.in

And therefore the libxml++ should also carry this dependency as a
consequence.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
