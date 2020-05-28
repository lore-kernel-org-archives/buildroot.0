From: Todd Sampson <sampsonats@gmail.com>
Date: Thu, 28 May 2020 18:42:49 -0400
Subject: [Buildroot] Cross-compile mariadb-connector-c
In-Reply-To: <CADJjDh_dv_HUS67aZUDHrD=1Liv9bWjXY3gVOvjat0zX1swLOA@mail.gmail.com>
References: <CADJjDh8R+_9Br-O9Dgy3Pp=WU7duOnOYEajGX3NJg324AaBx6Q@mail.gmail.com>
 <20200528233045.561f2808@windsurf.home>
 <CADJjDh_dv_HUS67aZUDHrD=1Liv9bWjXY3gVOvjat0zX1swLOA@mail.gmail.com>
Message-ID: <CADJjDh9BfqbmQxqhZMGGu2rOQJ8WQy6NSHwd0RV7NJHJRskNAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mariadb server is still in the target.

On Thu, May 28, 2020 at 5:35 PM Todd Sampson <sampsonats@gmail.com> wrote:

> No.  I'll do a make clean all just to make sure.
> [image: tmp.PNG]
> [image: mariadb-server.PNG]
>
> On Thu, May 28, 2020 at 5:30 PM Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> wrote:
>
>> On Thu, 28 May 2020 16:51:27 -0400
>> Todd Sampson <sampsonats@gmail.com> wrote:
>>
>> > I'm trying to cross-compile mariadb-connector-c version 3.1.8.  When I
>> > select mysqlsupport and mariadb, it seems like the mariadb server gets
>> put
>> > in my target too, which makes it very big.
>>
>> Have you enabled BR2_PACKAGE_MARIADB_SERVER ? If
>> BR2_PACKAGE_MARIADB_SERVER is disabled, the server should not be
>> installed.
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200528/9471ec36/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: tmp.PNG
Type: image/png
Size: 9919 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200528/9471ec36/attachment-0002.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mariadb-server.PNG
Type: image/png
Size: 60753 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200528/9471ec36/attachment-0003.png>
