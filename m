From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 6 Oct 2008 14:12:55 -0300
Subject: [Buildroot] [PATCH] enhance directfb configurability
In-Reply-To: <48EA3629.3030504@neli.hopto.org>
References: <gc8h2p$eil$2@ger.gmane.org>
	<d6cda7730810060855n6f1f710cmb149c7b3165ef29d@mail.gmail.com>
	<48EA3629.3030504@neli.hopto.org>
Message-ID: <d6cda7730810061012q53f70b70h9ed4423a5b081d72@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 6, 2008 at 1:00 PM, Micha Nelissen <micha@neli.hopto.org> wrote:
> Thiago A. Corr?a wrote:
>>
>> I'm not sure if forcing static lib on everyone is the right thing. If
>> there is only one application on the system that depends on DirectFB,
>> it might save some bytes, but if there are more than 1, shared lib
>> would be prefered.
>
> Wouldn't shared lib linking be the default? The static variant would need to
> be referenced explicitly by someone who wants to use it; but at least it's
> available. It also would only exist in the staging_dir, not the target dir.
>

Hmmm I'm not sure about the linking order. But then you are saying
that even with --enable-static DirectFB will build the shared lib too?
Others like Qt (embedded and desktop) only builds the static if you
specify you want the static. I apply here and give it a try then. :)

Regards,
   Thiago A. Correa
