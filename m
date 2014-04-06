From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 06 Apr 2014 11:48:53 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-05
In-Reply-To: <20140406110837.45baff8e@skate>
References: <20140406063010.119BC100CBA@stock.ovh.net>
 <20140406110837.45baff8e@skate>
Message-ID: <53412305.1080101@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 06/04/2014 11:08, Thomas Petazzoni a ?crit :
> Hello all,
>
> As usual, here is an analysis of yesterday build failures. I'd like to
> try to keep the number of failures as low as possible throughout the
> development cycle, so that during the debugging part of the cycle, we
> can really try to get down as much as possible.
>
> Sonic, Aaron, Ezequiel, Samuel, Gustavo, Eric, Anton and Alexander,
> there are questions for you below, please read on :-)
>
>>        i686 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/635a4c235524bf1bdeb00b5cb561ad601e23b9fe/
>>     powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/07961e79bbf689e323a673d8d7dbc40be6247365/
>>         arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/8d12fa43f0165feccc924d28e6268f9a1993cab7/
>>         arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/96dcf9a8597b6133b377084aa63636711a24c63c/
>>      x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/ffb87e2c411671080ee4bca3d22223726a2e05c4/
>>         arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/0f9b993ad2439c71b64d92e12fc437c8143d25a7/
> I will have a look at http://patchwork.ozlabs.org/patch/335116/ and
> apply it after testing.
ok, thanks.

>>      x86_64 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/389feb26b03a79a2a62e3090089503809fd3aee8/
>>        i686 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/6ec9ae9f7af2322edd16951243cf2f23819b825b/
> Anton, can you have a look at these issues?
I have send two patches for this one:
http://patchwork.ozlabs.org/patch/337249/
http://patchwork.ozlabs.org/patch/337248/

I'm not confident about the second one since It is only build tested.

Best regards,
Romain Naour
