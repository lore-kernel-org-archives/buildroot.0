From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Mon, 7 Sep 2015 13:24:04 -0300
Subject: [Buildroot] [PATCH] cmake: bump to version 3.3.1
In-Reply-To: <55EDAC8B.7060805@imgtec.com>
References: <1441633000-8235-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <55EDA295.8070807@imgtec.com> <55EDA8F5.6040503@imgtec.com>
 <CAHXCMM+FrPaSsfW0zakOnbf92GrQPN4_REc219eJ0R=c9GTHHg@mail.gmail.com>
 <55EDAC8B.7060805@imgtec.com>
Message-ID: <55EDBA24.90009@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/15 12:26, Vicente Olivert Riera wrote:

> well, in that case you only need to add jsoncpp to the current
> CMAKE_DEPENDENCIES line, and also select BR2_PACKAGE_JSONCPP in the
> Config.in:

Hi.
Thanks for the feedback, i've respinned into v2.
Actually you need to propagate the gcc version dependency from jsoncpp 
as well.
Regards.
