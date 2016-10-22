From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:43:30 +0200
Subject: [Buildroot] [PATCH v6 2/9] package/pkg-cmake.mk: move
 CMAKE_BUILD_TYPE definition into toolchainfile.cmake
In-Reply-To: <20161016111245.1847-3-s.martin49@gmail.com>
References: <20161016111245.1847-1-s.martin49@gmail.com>
 <20161016111245.1847-3-s.martin49@gmail.com>
Message-ID: <20161022164330.6dfc7bbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Oct 2016 13:12:38 +0200, Samuel Martin wrote:

> +    toolchainfile.cmake:
> +    * when used outside of Buildroot, if not specified on the command
> +      line, the CMAKE_BUILD_TYPE is by toolchainfile.cmake.

I've reworded this differently. Please double check that the new text
is fine.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
