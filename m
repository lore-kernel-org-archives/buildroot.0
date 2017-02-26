From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Feb 2017 17:22:23 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/lugaru: new package
In-Reply-To: <20170226145947.57dd33ca@free-electrons.com>
References: <20170225133600.15637-1-romain.naour@gmail.com>
 <20170225133600.15637-3-romain.naour@gmail.com>
 <20170226145947.57dd33ca@free-electrons.com>
Message-ID: <1c715851-d6b3-ae89-a6e8-17dc43e89bef@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 26/02/2017 ? 14:59, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat, 25 Feb 2017 14:36:00 +0100, Romain Naour wrote:
> 
>> +LUGARU_CONF_OPTS = -DSYSTEM_INSTALL=ON \
>> +	-DCMAKE_INSTALL_BINDIR=games \
>> +	-DCMAKE_INSTALL_DATADIR=share/games
> 
> Why are we passing custom CMAKE_INSTALL_<foo>DIR here?

We have to set SYSTEM_INSTALL otherwise the application "will default to looking
for the data in the 'Data' directory next to the binary"

But I've keep the custom CMAKE_INSTALL_<foo>DIR from the example in COMPILING.md
file... We can remove them.

Thanks for the review.

Best regards,
Romain

> 
> The rest of the patch looks good to me.
> 
> Thanks!
> 
> Thomas
> 
