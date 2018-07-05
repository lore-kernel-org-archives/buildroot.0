From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 5 Jul 2018 10:00:35 +0200
Subject: [Buildroot] [PATCH 2/5] pigz: new package
In-Reply-To: <20180704223029.288baa38@windsurf>
References: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
 <20180704070739.7259-3-thomas.de_schampheleire@nokia.com>
 <20180704223029.288baa38@windsurf>
Message-ID: <CAAXf6LUuPTEUw52SsYZ=EjcNKu8Rq8VAqM4fB6HxVcPM1i8jCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-07-04 22:30 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> On Wed,  4 Jul 2018 09:07:36 +0200, Thomas De Schampheleire wrote:
>> From: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
>>
>> A parallel implementation of gzip for modern
>> multi-processor, multi-core machines.
>>
>> Signed-off-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
>> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>> ---
>>  package/Config.in      |  1 +
>>  package/pigz/Config.in | 14 ++++++++++++++
>>  package/pigz/pigz.hash |  2 ++
>>  package/pigz/pigz.mk   | 21 +++++++++++++++++++++
>>  4 files changed, 38 insertions(+)
>>  create mode 100644 package/pigz/Config.in
>>  create mode 100644 package/pigz/pigz.hash
>>  create mode 100644 package/pigz/pigz.mk
>
> I've applied, with the following changes:
>
>     [Thomas: add entry to DEVELOPERS file, add hash for license file.]
>

Oops, I hadn't seen that you already applied these changes and I just sent a v2.

As I added one new change related to a more stable download URL for
pigz, I'll rebase and send v3.
Please ignore the v2, sorry for the noise.

/Thomas
