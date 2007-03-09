From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Mar 2007 09:09:32 +0100
Subject: [Buildroot] math.h / frexp problem
In-Reply-To: <82b0e9c80703081348v59584768xac210f9df4c3f3c9@mail.gmail.com>
References: <82b0e9c80703081348v59584768xac210f9df4c3f3c9@mail.gmail.com>
Message-ID: <20070309080930.GB9863@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 08, 2007 at 10:48:44PM +0100, zentrale at.work wrote:
>i'm using buildroot to build for a at91rm9200 (arm 920t core), and it works
>quite fine except for:
>
>it obviously fails to build a proper math.h and/or the lib behind it. if
>code uses frexp(), it will fail to build with "frexp() not found" any ideas?

Please file a bug (if you didn't do that already) and attach your
.config and uClibc.config. Thanks
