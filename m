From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 14 Sep 2015 17:41:47 -0700
Subject: [Buildroot] [PATCH 1/1] add python simple template module
In-Reply-To: <20150913200443.38a3512d@free-electrons.com>
References: <1442162503-5817-1-git-send-email-stevecalfee@gmail.com>
 <20150913200443.38a3512d@free-electrons.com>
Message-ID: <CAJJ6jxuir9vNJCPYGVJAoFrjSCcQ2rArXJ+MtB5wNCujasf1Pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Sep 13, 2015 at 11:04 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Steve Calfee,
>
> The title of the commit should be:
>
>         python-pyratemp: new package
>
> On Sun, 13 Sep 2015 09:41:43 -0700, Steve Calfee wrote:
>
>
>> diff --git a/package/python-pyratemp/python-pyratemp.hash b/package/python-pyratemp/python-pyratemp.hash
>> new file mode 100644
>> index 0000000..0abb9e0
>> --- /dev/null
>> +++ b/package/python-pyratemp/python-pyratemp.hash
>> @@ -0,0 +1,4 @@
>> +# From http://www.simple-is-better.org/template
>> +# Locally calculated:
>
> Having those two comments together do not make sense. Either the hash
> is provided by the official upstream website and you should write the
> first line, or the hash is not available from the upstream website, in
> which case you use a locally calculated hash.
>
>> +sha256 c45ed656ada482a02fe780495f37a695e7671accb04f918f7e7f18abf877bc71 pyratemp-0.3.2.tgz
>> +
>
> Unneeded empty line.
>

Thanks for the review.

I just rebuilt and found that the .hash file has to have an eol after
that last line. So please reject the V2 version and I will send in
another one tomorrow which will survive through a make clean.

Regards, Steve
