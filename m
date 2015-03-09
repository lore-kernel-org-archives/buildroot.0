From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 09 Mar 2015 09:57:01 -0300
Subject: [Buildroot] [PATCH 2/5] libnl: add patch to add Libs.private in
 libnl-3.0.pc
In-Reply-To: <1425728422-14113-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425728422-14113-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425728422-14113-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <54FD989D.1020900@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/2015 08:40 AM, Thomas Petazzoni wrote:

> Having a properly defined Libs.private field allows to make sure
> static linking against libnl-3.0 works fine, at least as long as
> pkg-config is used.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Very...
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
