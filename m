From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 20:00:56 +0100
Subject: [Buildroot] [PATCH 1/2] package/wpewebkit: fix build with
 ENABLE_C_LOOP=ON
In-Reply-To: <20201020154321.3491904-2-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 20 Oct 2020 18:43:20 +0300")
References: <20201020154321.3491904-1-aperez@igalia.com>
 <20201020154321.3491904-2-aperez@igalia.com>
Message-ID: <87wnz8g8lz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > The ENABLE_C_LOOP option conflicts with ENABLE_SAMPLING_PROFILER, so
 > the WebKit CMake build system will emit an error when both are enabled
 > at the same time. To avoid hitting that situation, explicitly disable
 > ENABLE_SAMPLING_PROFILER as needed.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
