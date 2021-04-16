From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 16 Apr 2021 09:41:54 +0300
Subject: [Buildroot] [PATCH v3 3/3] package/osm2pgsql: new package
In-Reply-To: <4434f6fa-e05e-7a26-bf65-c82fd37210ad@mind.be>
References: <20210415150356.775904-1-fido_max@inbox.ru>
 <20210415150356.775904-3-fido_max@inbox.ru>
 <4434f6fa-e05e-7a26-bf65-c82fd37210ad@mind.be>
Message-ID: <16cfad7c-ac96-0b96-6cf2-424cb151408a@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Strange situation:

./utils/check-package package/osm2pgsql/*
65 lines processed
0 warnings generated


15.04.2021 23:32, Arnout Vandecappelle ?????:
>> +	select BR2_PACKAGE_ZLIB
>> +	help
>> +	  osm2pgsql is a tool for loading OpenStreetMap data into a
>> +	  PostgreSQL / PostGIS database suitable for applications like
>   Line too long, as reported by check-package.
> 
