From: Sinan Akman <sinan@writeme.com>
Date: Sat, 02 Nov 2013 02:31:48 -0400
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131101193153.04cdd643@skate>
References: <20131029204108.5d707d09@skate> <20131101193153.04cdd643@skate>
Message-ID: <52749C54.8080601@writeme.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/2013 02:31 PM, Thomas Petazzoni wrote:
> Hello all,
>
> Following to this e-mail, I've just added a bunch of architecture
> "maintainers" that will receive each day an e-mail with list of the
> build failures related to the architecture they take care of in
> Buildroot. See below for the detail.
>
> On Tue, 29 Oct 2013 20:41:08 +0100, Thomas Petazzoni wrote:
>
>> +------------+---------+----------+-------+------------+------------+
>> | arch       | success | failures | total | pctsuccess | pctfailure |
>> +------------+---------+----------+-------+------------+------------+
>> | bfin       |      10 |      607 |   617 |     1.6207 |    98.3793 |
>
> E-mail sent to Aaron Wu and Sonic Zhang from Analog Devices.
>
>> | microblaze |       6 |      308 |   314 |     1.9108 |    98.0892 |
>
> E-mail sent to Spenser Gilliland.
>
>> | nios2      |       2 |       49 |    51 |     3.9216 |    96.0784 |
>
> E-mail sent to Ezequiel Garcia.
>
>> | xtensa     |      13 |      314 |   327 |     3.9755 |    96.0245 |
>
> E-mail sent to Chris Zankel.
>
>> | avr32      |      34 |      305 |   339 |    10.0295 |    89.9705 |
>
> E-mail sent to Simon Dawson.
>
>> | mips64el   |     162 |      498 |   660 |    24.5455 |    75.4545 |
>
> E-mail sent to Markos Chandras, from Imagination Technologies.
>
>> | aarch64    |      82 |      243 |   325 |    25.2308 |    74.7692 |
>
> No specific maintainer (I'm mainly taking care of aarch64 issues)
>
>> | arc        |      95 |      234 |   329 |    28.8754 |    71.1246 |
>
> E-mail sent to Mischa Jonker, from Synopsis.
>
>> | sh4a       |     158 |      171 |   330 |    47.8788 |    51.8182 |
>
> No specific maintainer. Who anyone be interested?
>
>> | mipsel     |     172 |      168 |   340 |    50.5882 |    49.4118 |
>
> E-mail sent to Markos Chandras, from Imagination Technologies.
>
>> | mips       |     172 |      165 |   337 |    51.0386 |    48.9614 |
>
> E-mail sent to Markos Chandras, from Imagination Technologies.
>
>> | arm        |    2302 |     1788 |  4097 |    56.1875 |    43.6417 |
>> | powerpc    |    2794 |     1616 |  4411 |    63.3416 |    36.6357 |

   Hi Thomas

   I don't know if I would qualify well as a maintainer but
I have quite a number of powerpc boards that I build and use
buildroot almost regularly.

   Let me know if this can be of any help.

   Regards

   Sinan Akman

>> | sh4        |     208 |      120 |   328 |    63.4146 |    36.5854 |
>> | x86_64     |     874 |      412 |  1288 |    67.8571 |    31.9876 |
>> | i686       |    2369 |      572 |  2943 |    80.4961 |    19.4359 |
>
> No specific maintainers for these architectures.
>
> Thomas
>
