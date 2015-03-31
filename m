From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Mar 2015 20:06:13 -0300
Subject: [Buildroot] [PATCH 2/2] package/powertop: depends on c++
In-Reply-To: <1427472097-30708-2-git-send-email-bernd.kuhls@t-online.de>
References: <1427472097-30708-1-git-send-email-bernd.kuhls@t-online.de>
 <1427472097-30708-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <551B2865.50007@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/27/2015 01:01 PM, Bernd Kuhls wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

.cpp files which #include <iostream> are a pretty good indication of C++ :)

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
