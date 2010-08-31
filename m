From: James J. Dines <jdines@jdines.net>
Date: Tue, 31 Aug 2010 18:17:45 -0400
Subject: [Buildroot] Make 3.82 testing progress update
In-Reply-To: <87pqwzwzp6.fsf@macbook.be.48ers.dk>
References: <4C7B99D5.9010703@jdines.net>
	<87bp8kxlve.fsf@macbook.be.48ers.dk>	<4C7BC441.3010006@jdines.net>	<201008301701.22856.yann.morin.1998@anciens.enib.fr>	<4C7BD1D6.5070100@jdines.net>	<20100830163153.GA12776@merkur.ravnborg.org>	<8739tvyip6.fsf@macbook.be.48ers.dk>
	<4C7C12E3.30005@jdines.net>	<87y6bnx1h8.fsf@macbook.be.48ers.dk>
	<4C7C1E28.1060806@jdines.net> <87pqwzwzp6.fsf@macbook.be.48ers.dk>
Message-ID: <4C7D7F89.3070502@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/30/2010 05:36 PM, Peter Korsgaard wrote:
>>>>>> "James" == James J Dines <jdines@jdines.net> writes:
> 
> Hi,
> 
>  James> I went for a third option (applying Yann's patch) and it indeed
>  James> allows the 'make clean' to work.  I remain confused why we did
>  James> not need this patch to do a complete build with make 3.81
>  James> however.  I just tried it again, and I do not get the error
>  James> message on my other machine with 3.81 even without the patch.
> 
> No, it seems like make 3.81 ignores those invalid lines.
> 
> besides this issue, is everything working for you with ake 3.82?
> 

Other than the host-module-init-tools-3.11 issue already covered in
great detail today, which presumably needs to be fixed upstream
eventually, I was able to get everything to build but a kernel.

I haven't determined if this is something I am doing wrong or not yet.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMfX+BAAoJECSpOhdQESq6PHAH/Rn7gPJxS8hKmImZpUzRDOXQ
+BREl/iizfrpz0zIwn7PYuYQG9yErWRBZxOntLVU7Qm54mdH24LJAqG+wR8V+T70
uzsh1iB8M1ZiXFPwa8wXoq5H4pzg3lrWqzAwEQ2HFtY5SViKpCNhyFUVA8z/Iqyh
iy8VPM7H+Evuhv+XDBvXsqX9M7Ls7xK2sQ17vsKfMMIishe9vB8GnqxzqJmrc+5G
bd98aENrw/0czP5brNUlPVrkBhkT7H+IX4FVMKS8DeRwQEiyUJxx9HEWo9J4TVRs
IHjNf5mFiEVOkWh1VdZXz/2itxbn8sMYzagmjrk6VosLwurgxSG7mj7V70S7tYk=
=EVoC
-----END PGP SIGNATURE-----
