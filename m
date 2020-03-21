From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 22:31:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/gssdp: explicitly disable vapi
In-Reply-To: <20200315164150.640729-1-aduskett@gmail.com> (aduskett's message
 of "Sun, 15 Mar 2020 09:41:50 -0700")
References: <20200315164150.640729-1-aduskett@gmail.com>
Message-ID: <87d0954cp5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Currently, vapi support does not work with meson due to meson calling vapigen
 > directly instead of the vala wrapper. As such, when building typelib files for
 > gobject-introspection, vapigen fails to find the proper .gir files and fails
 > to build.

 > Explicitly disable vapi until a fix for vapi is made.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
