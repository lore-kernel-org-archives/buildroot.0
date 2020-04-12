From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 21:33:04 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/rabbitmq-server: bump
 version to 3.8.2
In-Reply-To: <20200213151414.25831-2-frank.vanbever@essensium.com>
References: <20200204100733.22106-3-frank.vanbever@essensium.com>
 <20200213151414.25831-1-frank.vanbever@essensium.com>
 <20200213151414.25831-2-frank.vanbever@essensium.com>
Message-ID: <20200412213304.409908c0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Feb 2020 16:14:14 +0100
Frank Vanbever <frank.vanbever@essensium.com> wrote:

> RabbitMQ now depends on Elixir for the build system.
> The log directory is required for the server to start with the default
> configuration. This behaviour was changed in v3.7 with the move to erlang-lager
> as the logging library.
> 
> License changes:
> - LICENSE: Added clarification about the licensing of a number of included
>   dependencies and a URL changed to HTTPS. License remains MPL-1.1
> - LICENSE-BSD-base64js: URL changed to https (license text is actually MIT)
> - LICENSE-MIT-Flot: year update
> - LICENSE-MIT-JQuery164: URL changed to https
> - LICENSE-MPL-RabbitMQ: URL changed to https, year update
> - LICENSE-MPL2: URL changed to https
> 
> Removed licenses:
> - LICENSE-APL2-Rebar: Removed dependency
> - LICENSE-BSD-gl-Matrix: Removed dependency
> - LICENSE-ERL-OTP: Removed license
> - LICENSE-MIT-Mochiweb: Removed dependency
> - LICENSE-MIT-SockJS: Removed dependency
> 
> New licenses:
> - LICENSE-APACHE2-excanvas: new bundled dependency (Apache 2)
> - LICENSE-BSD-recon: new bundled dependency (BSD 3-clause)
> - LICENSE-erlcloud: new bundled dependency (BSD 2-clause)
> - LICENSE-httpc_aws: new bundled dependency (BSD 3-clause)
> - LICENSE-ISC-cowboy: new bundled dependency (ISC)
> - LICENSE-MIT-EJS: new bundled dependency (MIT)
> - LICENSE-MIT-Erlware-commons: license was present in 3.6.6 but not included in
>   the list
> - LICENSE-MIT-jQuery: new bundled dependency (MIT)
> - LICENSE-MIT-Sammy: new bundled dependency (MIT)
> - LICENSE-rabbitmq_aws: new bundled dependency (BSD 3-clause)
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> ---
> Changes v2 -> v3:
>  - Cleaned up license files
> Changes v1 -> v2:
>  - Remove reference to BR2_PACKAGE_HOST_ELIXIR

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
