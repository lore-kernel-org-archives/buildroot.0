From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 19 Jan 2007 16:00:58 +0100
Subject: [Buildroot] about the float lib
In-Reply-To: <030901c73b98$0f444a70$0c96a8c0@Thomas>
References: <030901c73b98$0f444a70$0c96a8c0@Thomas>
Message-ID: <20070119150058.GA16806@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 19, 2007 at 03:04:22PM +0800, thomas.luo wrote:
>hi all,
>i meet some problem when use the ARM gcc 4.1.1 with arg -msoft-float,  the 
>gcc can't find the -lfloat.
>how to produce float lib?

Please edit package/libfloat/libfloat.mk
and remove the check for the gcc version 3.3 and let me know if that
fixed it.
