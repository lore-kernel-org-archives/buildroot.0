From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 7 Oct 2008 17:31:20 -0300
Subject: [Buildroot] [PATCH] enhance directfb configurability
In-Reply-To: <d6cda7730810061008v71de4b85xc39765cf99e1ab17@mail.gmail.com>
References: <gc8h2p$eil$2@ger.gmane.org>
	<d6cda7730810060855n6f1f710cmb149c7b3165ef29d@mail.gmail.com>
	<48EA3629.3030504@neli.hopto.org>
	<d6cda7730810061008v71de4b85xc39765cf99e1ab17@mail.gmail.com>
Message-ID: <d6cda7730810071331r4da3f876s1288b70eb038934@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Wouldn't shared lib linking be the default? The static variant would need to
>> be referenced explicitly by someone who wants to use it; but at least it's
>> available. It also would only exist in the staging_dir, not the target dir.
>>
>
> Hmmm I'm not sure about the linking order. But then you are saying
> that even with --enable-static DirectFB will build the shared lib too?
> Others like Qt (embedded and desktop) only builds the static if you
> specify you want the static. I apply here and give it a try then. :)
>

Ok, it built both static and shared. Seams ok, so I commited (r23621)
with some small fixes.
Thanks!

Kind Regards,
   Thiago A. Correa
