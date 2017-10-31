From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Tue, 31 Oct 2017 12:21:13 +0530
Subject: [Buildroot] [PATCH v4 05/11] board: Add SoPine support
In-Reply-To: <24dff9c2-03e7-6c34-1f11-ca7eca71bc78@arm.com>
References: <1509041511-30956-1-git-send-email-jagan@amarulasolutions.com>
 <1509041511-30956-6-git-send-email-jagan@amarulasolutions.com>
 <24dff9c2-03e7-6c34-1f11-ca7eca71bc78@arm.com>
Message-ID: <CAD6G_RSdw6fkfK8O7c6ejw3M=xOpR-RBtMuM2Cn73Hbjod-pYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 31, 2017 at 6:58 AM, Andr? Przywara <andre.przywara@arm.com> wrote:
> On 26/10/17 19:11, Jagan Teki wrote:
>> Add initial support for SoPine board with below features:
>> - U-Boot 2017.09
>> - Linux 4.13.7
>> - Default packages from buildroot
>
> ....
>
>> diff --git a/board/pine64/sopine/readme.txt b/board/pine64/sopine/readme.txt
>> new file mode 100644
>> index 0000000..05d26ee
>> --- /dev/null
>> +++ b/board/pine64/sopine/readme.txt
>> @@ -0,0 +1,38 @@
>> +Intro
>> +=====
>> +
>> +This default configuration will allow you to start experimenting with the
>> +buildroot environment for the SoPine. With the current configuration
>> +it will bring-up the board, and allow access through the serial console.
>> +
>> +SoPINE link:
>> +https://www.pine64.org/?page_id=1491
>> +
>> +Wiki link:
>> +https://confluence.amarulasolutions.com/display/ODWIKI/Pine64+SoPine
>
> Is that supposed to be externally accessible? The name doesn't resolve
> for me. But even if, how stable is that link anyway?
> I guess you want to point to the linux-sunxi.org Wiki instead.

Yes, we're maintaining these as stable as possible, in fact the
content doesn't have redundant details with linux-sunxi.org and we
show only Mainline details which we supported and used the same in
buildroot. Even we link the linux-sunxi at the first point.

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
